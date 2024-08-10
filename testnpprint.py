from zignumpyprint import numpyzigprint
import numpy as np
shape=(3,3,3)

c = np.random.randint(1, 127, np.prod(shape), dtype="i").reshape(shape)
dtypes = [
    "i",
    "l",
    "L",
    "I",
    "b",
    "B",
    "h",
    "H",
    "q",
    "Q",
    "f",
    "d",
    #"D",
]
for d in dtypes:
    tmp = c.astype(d)
    numpyzigprint(tmp)

