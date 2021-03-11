import matplotlib.pyplot as plt
import numpy as np

V_i = [0.20, 0.40, 0.60, 0.80, 1.00, 1.20, 1.40, 1.60, 1.80, 2.00, 2.20, 2.40, 2.60, 2.80, 3.00, 3.20, 3.40, 3.60, 3.80, 4.00, 4.20, 4.40, 4.44]
V_o = [4.93, 4.93, 4.93, 4.93, 4.93, 4.93, 4.93, 4.93, 4.93, 4.93, 4.93, 3.65, 3.08, 2.97, 2.83, 2.69, 2.53, 2.33, 2.06, 0.02, 0.02, 0.02, 0.01]

fig = plt.figure()

ax1 = fig.add_subplot(111)

ax1.scatter(V_i, V_o, marker='o', c='', edgecolor='black')
ax1.plot(V_i, V_o, color="red")
plt.xlabel("Vi")
plt.ylabel("Vo")
plt.show()