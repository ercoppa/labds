import sys
import glob
import os

for filename in glob.glob(sys.argv[1] + '/*/*.html'):
    if 'slides' in filename:
        continue
    if not os.path.basename(filename)[0].isdigit():
        continue

    print("Processing", filename)
    
    data = open(filename, 'r').read()

    slide_button = """

    <button onclick="window.open(window.location.pathname.replace('.html', '.slides.html'));"
    class="btn btn-sm btn-fullscreen-button"
    title="Slide"
    data-bs-placement="bottom" data-bs-toggle="tooltip"
    >
    
    <span class="btn__icon-container">
        <i class="fa-brands fa-slideshare"></i>
    </span>

    </button>

    """

    pivot = '<button onclick="toggleFullScreen()"'

    if 'fa-slideshare' not in data:
        data = data.replace(pivot, slide_button + pivot)

    open(filename, 'w').write(data)