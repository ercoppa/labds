import sys
import glob
import os

import asyncio
import os
import tempfile

from subprocess import PIPE, Popen
# from pyppeteer import launch

import concurrent.futures

# async def html_to_pdf(html_file, pdf_file, pyppeteer_args=None):
#     """Convert a HTML file to a PDF"""

#     print(f"Generating PDF for {html_file}")

#     browser = await launch(
#         handleSIGINT=False,
#         handleSIGTERM=False,
#         handleSIGHUP=False,
#         headless=True,
#         args=["--no-sandbox"],
#     )

#     page = await browser.newPage()
#     await page.setViewport(dict(width=994, height=768))
#     await page.emulateMedia("screen")

#     await page.goto(f"file://{html_file}", {"waitUntil": ["networkidle2"]})

#     page_margins = {
#         # "left": "20px",
#         # "right": "20px",
#         # "top": "30px",
#         # "bottom": "30px",
#     }

#     page_margins = {
#         "left": "0px",
#         "right": "0px",
#         "top": "0px",
#         "bottom": "0px",
#     }

#     dimensions = await page.evaluate(
#         """() => {
#         return {
#             width: document.body.scrollWidth,
#             height: document.body.scrollHeight,
#             offsetWidth: document.body.offsetWidth,
#             offsetHeight: document.body.offsetHeight,
#             deviceScaleFactor: window.devicePixelRatio,
#         }
#     }"""
#     )
#     dimensions = await page.evaluate(
#         """() => {
#         return {
#             width: 1200,
#             height: 700,
#             offsetWidth: 1100,
#             offsetHeight: 600,
#             deviceScaleFactor: 2,
#         }
#     }"""
#     )
#     width = dimensions["width"]
#     height = dimensions["height"]

#     await page.pdf(
#         {
#             "path": pdf_file,
#             # "format": "A4",
#             "printBackground": True,
#             "margin": page_margins,
#             "height": height,
#             "width": width,
#             #"scale": 2.0
#         }
#     )

#     await browser.close()

for filename in sorted(glob.glob('*/*.ipynb')):
    print("Processing", filename)

    if 'ALL' not in os.environ and os.path.exists(filename.replace(".ipynb", ".pdf")) \
        and os.path.getmtime(filename) < os.path.getmtime(filename.replace(".ipynb", ".slides.html")) \
        and os.path.getmtime(filename) < os.path.getmtime(filename.replace(".ipynb", ".pdf")):
        continue

    os.system('SCROLLABLE=False bash scripts/process.sh ' + filename)

    # pool = concurrent.futures.ThreadPoolExecutor()
    # pool.submit(
    #     asyncio.run,
    #     html_to_pdf(
    #         os.getcwd() + "/" + filename.replace('.ipynb', '.slides.html?print-pdf'), 
    #         os.getcwd() + "/" + filename.replace('.ipynb', '.pdf')
    #     ),
    # ).result()

    from playwright.sync_api import sync_playwright, Playwright

    def run(playwright: Playwright, verbose=False):

        if verbose: print("Launching the browser")

        chromium = playwright.chromium # or "firefox" or "webkit".
        browser = chromium.launch(
            headless=True,
            args = [
                "--disable-gpu"
                '--no-sandbox',
                '--disable-setuid-sandbox',
                '--disable-dev-shm-usage',
                '--disable-accelerated-2d-canvas',
                '--no-zygote',
                '--single-process'
            ]
        )
        context = browser.new_context()

        if verbose: print(browser)
        if verbose: print("Opening a new page")

        page = context.new_page()

        if verbose: print("Setting the viewport")

        page.emulate_media(media="screen")

        if verbose: print("Visiting the page")

        html_file = os.getcwd() + "/" + filename.replace('.ipynb', '.slides.html?print-pdf')
        page.goto(
            f"file://{html_file}",
            wait_until="load"
        )
        
        if verbose: print("Waiting for 800ms")

        page.wait_for_timeout(1000);

        page.pdf(
            path=os.getcwd() + "/" + filename.replace('.ipynb', '.pdf'),
            print_background=True,
            margin=[],
            format="A4",
            # height="800",
            # width="1200",
        )
        browser.close()

    with sync_playwright() as playwright:
        run(playwright)

    os.system('SCROLLABLE=True bash scripts/process.sh ' + filename)