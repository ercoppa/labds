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

    jupyterlite_button = """<span class="btn__text-container">Colab</span>
</a>
</li>

<li><a href="https://ercoppa.github.io/jupyterlite/lab/?fromURL=https://ercoppa.github.io/labds/_sources/<PATH>" target="_blank"
  class="btn btn-sm dropdown-item"
  title="Launch on JupyterLite"
  data-bs-placement="left" data-bs-toggle="tooltip"
>
 

<span class="btn__icon-container">
 
   <img alt="JupyterLite logo" src="https://avatars.githubusercontent.com/u/81094398?s=200&v=4">
 </span>
<span class="btn__text-container">JupyterLite</span>
</a>
</li>
    """

    pivot2 = """<span class="btn__text-container">Colab</span>
</a>
</li>"""

    pivot = '<button onclick="toggleFullScreen()"'

    if 'fa-slideshare' not in data:
        data = data.replace(pivot, slide_button + pivot)
        data = data.replace(
            "window.print()", 
            "window.open(window.location.pathname.replace('.html', '.pdf'));"
        )
        data = data.replace(
            pivot2,
            jupyterlite_button.replace("<PATH>", filename.lstrip("/docs").replace(".html", ".ipynb"))
        )

    open(filename, 'w').write(data)