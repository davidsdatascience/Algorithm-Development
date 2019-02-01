︠418c33b2-a979-40cb-b8e8-aeca9c783e0b︠
import matplotlib.pyplot as plt
from matplotlib.patches import Circle, PathPatch
# register Axes3D class with matplotlib by importing Axes3D
from mpl_toolkits.mplot3d import Axes3D
import mpl_toolkits.mplot3d.art3d as art3d
from matplotlib.text import TextPath
from matplotlib.transforms import Affine2D


def text3d(ax, xyz, s, zdir="z", size=None, angle=0, usetex=False, **kwargs):

    x, y, z = xyz
    if zdir == "y":
        xy1, z1 = (x, z), y
    elif zdir == "y":
        xy1, z1 = (y, z), x
    else:
        xy1, z1 = (x, y), z

    text_path = TextPath((0, 0), s, size=size, usetex=usetex)
    trans = Affine2D().rotate(angle).translate(xy1[0], xy1[1])

    p1 = PathPatch(trans.transform_path(text_path), **kwargs)
    ax.add_patch(p1)
    art3d.pathpatch_2d_to_3d(p1, z=z1, zdir=zdir)





sp=[18, 16, 14, 12, 14, 16, 14, 12, 10, 8, 10, 8, 6, 4, 6, 8, 10, 8, 6, 4, 6, 8, 10, 12, 14, 16, 18, 16, 18, 16, 14, 16, 18, 16, 18, 20, 18, 20, 18, 20, 22, 24, 22, 24, 22, 24, 22, 20, 18, 20, 22, 24, 26, 24, 26, 24, 26, 28, 30, 28, 30, 32, 34, 36, 34, 32, 30, 28, 30, 28, 30, 32, 34, 32, 30, 32, 34, 36, 38, 40, 42, 40, 38, 40, 42, 44, 46, 48, 50, 48, 50, 48, 50, 52, 54, 56, 58, 60, 58, 56]




fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

pt=[]

for i in range(0,len(sp)):
    p = Circle((0, 0), sp[i])
    pt.append(p)
    ax.add_patch(pt[i])
    art3d.pathpatch_2d_to_3d(pt[i], z=i, zdir="x")



text3d(ax, (4, -2, 0), "X-axis", zdir="z", size=.5, usetex=False,
       ec="none", fc="k")
text3d(ax, (12, 4, 0), "Y-axis", zdir="z", size=.5, usetex=False,
       angle=.5*3.14159, ec="none", fc="k")
text3d(ax, (12, 10, 4), "Z-axis", zdir="y", size=.5, usetex=False,
       angle=.5*3.14159, ec="none", fc="k")

text3d(ax, (1, 5, 0),
       r"$\displaystyle G_{\mu\nu} + \Lambda g_{\mu\nu} = "
       r"\frac{8\pi G}{c^4} T_{\mu\nu}  $",
       zdir="z", size=1, usetex=True,
       ec="none", fc="k")

ax.set_xlim3d(0, 150)
ax.set_ylim3d(-100, 100)
ax.set_zlim3d(-100, 100)

plt.show()


︡4f3b79fe-d0b4-40b7-aacf-720aed3a0f98︡{"stdout":"<matplotlib.patches.Circle object at 0xfc46190>\n<matplotlib.patches.Circle object at 0xfc46250>\n<matplotlib.patches.Circle object at 0xfc46650>\n<matplotlib.patches.Circle object at 0xfc46a50>\n<matplotlib.patches.Circle object at 0xfc46e50>\n<matplotlib.patches.Circle object at 0xfc4c290>\n<matplotlib.patches.Circle object at 0xfc4c690>\n<matplotlib.patches.Circle object at 0xfc4ca90>\n<matplotlib.patches.Circle object at 0xfc4ce90>\n<matplotlib.patches.Circle object at 0xfc522d0>\n<matplotlib.patches.Circle object at 0xfc526d0>\n<matplotlib.patches.Circle object at 0xfc52ad0>\n<matplotlib.patches.Circle object at 0xfc52ed0>\n<matplotlib.patches.Circle object at 0xfc57310>\n<matplotlib.patches.Circle object at 0xfc57710>\n<matplotlib.patches.Circle object at 0xfc57b10>\n<matplotlib.patches.Circle object at 0xfc57f10>\n<matplotlib.patches.Circle object at 0xfc5d350>\n<matplotlib.patches.Circle object at 0xfc5d750>\n<matplotlib.patches.Circle object at 0xfc5db50>\n<matplotlib.patches.Circle object at 0xfc5df50>\n<matplotlib.patches.Circle object at 0xfe0b390>\n<matplotlib.patches.Circle object at 0xfe0b790>\n<matplotlib.patches.Circle object at 0xfe0bb90>\n<matplotlib.patches.Circle object at 0xfe0bf10>\n<matplotlib.patches.Circle object at 0xfe113d0>\n<matplotlib.patches.Circle object at 0xfe117d0>\n<matplotlib.patches.Circle object at 0xfe11bd0>\n<matplotlib.patches.Circle object at 0xfe11f50>\n<matplotlib.patches.Circle object at 0xfe15410>\n<matplotlib.patches.Circle object at 0xfe15810>\n<matplotlib.patches.Circle object at 0xfe15c10>\n<matplotlib.patches.Circle object at 0xfe15f50>\n<matplotlib.patches.Circle object at 0xfe1c450>\n<matplotlib.patches.Circle object at 0xfe1c850>\n<matplotlib.patches.Circle object at 0xfe1cc50>\n<matplotlib.patches.Circle object at 0xfe1cf90>\n<matplotlib.patches.Circle object at 0xfe23490>\n<matplotlib.patches.Circle object at 0xfe23890>\n<matplotlib.patches.Circle object at 0xfe23c90>\n<matplotlib.patches.Circle object at 0xfe28150>\n<matplotlib.patches.Circle object at 0xfe284d0>\n<matplotlib.patches.Circle object at 0xfe288d0>\n<matplotlib.patches.Circle object at 0xfe28cd0>\n<matplotlib.patches.Circle object at 0xfe2e110>\n<matplotlib.patches.Circle object at 0xfe2e510>\n<matplotlib.patches.Circle object at 0xfe2e910>\n<matplotlib.patches.Circle object at 0xfe2ed10>\n<matplotlib.patches.Circle object at 0xfc399d0>\n<matplotlib.patches.Circle object at 0xfc376d0>\n<matplotlib.patches.Circle object at 0xfc333d0>\n<matplotlib.patches.Circle object at 0xfc21c90>\n<matplotlib.patches.Circle object at 0xfc21050>\n<matplotlib.patches.Circle object at 0xfe33090>\n<matplotlib.patches.Circle object at 0xfe33610>\n<matplotlib.patches.Circle object at 0xfe33a10>\n<matplotlib.patches.Circle object at 0xfe33e10>\n<matplotlib.patches.Circle object at 0xfe3d250>\n<matplotlib.patches.Circle object at 0xfe3d650>\n<matplotlib.patches.Circle object at 0xfe3da50>\n<matplotlib.patches.Circle object at 0xfe3de50>\n<matplotlib.patches.Circle object at 0xfe43290>\n<matplotlib.patches.Circle object at 0xfe43690>\n<matplotlib.patches.Circle object at 0xfe43a90>\n<matplotlib.patches.Circle object at 0xfe43e90>\n<matplotlib.patches.Circle object at 0xfeb52d0>\n<matplotlib.patches.Circle object at 0xfeb56d0>\n<matplotlib.patches.Circle object at 0xfeb5ad0>\n<matplotlib.patches.Circle object at 0xfeb5ed0>\n<matplotlib.patches.Circle object at 0xfebb310>\n<matplotlib.patches.Circle object at 0xfebb710>\n<matplotlib.patches.Circle object at 0xfebbb10>\n<matplotlib.patches.Circle object at 0xfebbf10>\n<matplotlib.patches.Circle object at 0xfec2350>\n<matplotlib.patches.Circle object at 0xfec2750>\n<matplotlib.patches.Circle object at 0xfec2b50>\n<matplotlib.patches.Circle object at 0xfec2f50>\n<matplotlib.patches.Circle object at 0xfec7390>\n<matplotlib.patches.Circle object at 0xfec7790>\n<matplotlib.patches.Circle object at 0xfec7b90>\n<matplotlib.patches.Circle object at 0xfec7f10>"}︡{"stdout":"\n<matplotlib.patches.Circle object at 0xfece3d0>\n<matplotlib.patches.Circle object at 0xfece7d0>\n<matplotlib.patches.Circle object at 0xfecebd0>\n<matplotlib.patches.Circle object at 0xfecef50>\n<matplotlib.patches.Circle object at 0xfed3410>\n<matplotlib.patches.Circle object at 0xfed3810>\n<matplotlib.patches.Circle object at 0xfed3c10>\n<matplotlib.patches.Circle object at 0xfed3f50>\n<matplotlib.patches.Circle object at 0xfed9450>\n<matplotlib.patches.Circle object at 0xfed9850>\n<matplotlib.patches.Circle object at 0xfed9c50>\n<matplotlib.patches.Circle object at 0xfed9f90>\n<matplotlib.patches.Circle object at 0xfede490>\n<matplotlib.patches.Circle object at 0xfede890>\n<matplotlib.patches.Circle object at 0xfedec90>\n<matplotlib.patches.Circle object at 0xfee6150>\n<matplotlib.patches.Circle object at 0xfee64d0>\n<matplotlib.patches.Circle object at 0xfee68d0>\n"}︡{"stdout":"(0, 150)\n"}︡{"stdout":"(-100, 100)\n"}︡{"stdout":"(-100, 100)\n"}︡{"once":false,"file":{"show":true,"uuid":"79e672f8-5c46-4fa5-9ee7-caf9d8a345dd","filename":"185cfe56-3e1d-4789-9e6c-433d0a1e7818.png"}}︡
︠2b9c381a-4c85-4de7-b116-34849654ff7e︠
︡d1b87eb9-b67e-4b8e-8547-109dc92619f0︡
︠73c5952a-4e28-423a-8034-ceeda47afb82︠
︡8054278a-a1c6-4cd7-b78f-88940ee490bf︡
︠21f02c94-9b91-474b-96a2-395d89e18e37︠







︡e78db8e4-d09c-43a4-a292-ef0a25acfef8︡
︠003c207a-bf17-405f-b06a-15e6a4139726︠

︡19c03fbb-139b-4a2a-a310-5f56cb5c73b0︡
︠1347ede6-e041-4627-a51a-1754260047f6︠

︠cd4024ea-d3e1-45db-8aec-f2d37a666776︠

︠6fe0d74e-1e2b-4bfd-8352-18ba0a7d66e8︠

︠c333c949-9184-42a7-b8c4-3bf75c6b41fb︠

︠4e0dcca1-7900-4393-98af-a167c72171cb︠

︠4d0b3857-6a72-4838-8ed3-cce8681159ce︠

︡06569a1c-a3ed-425c-8b31-341d74f5e76b︡
︠f2f3987b-394e-4ff0-9847-5ba6c4dd530x︠
︠08c059f1-ad4f-4b23-88cd-5212344faaf8︠

︠cf484374-0303-4e7c-8485-7571b6b01930︠
︡5863018a-f0c8-4e32-bcae-9aa6392737c2︡
︠029e33fb-7c18-4b87-9c41-2b57b13d50cf︠










