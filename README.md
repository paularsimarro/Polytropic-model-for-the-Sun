# Lane-Emden Numerical Analysis: Solar Polytropic Modeling

This repository contains a numerical study of the **Lane–Emden equation** to model the internal structure of the Sun as a polytropic star. The project explores the solutions for different polytropic indices ($n$) and calculates the physical parameters of the Sun using a model with $n=3$.

## 1. Project Overview
A polytropic model assumes a relationship between pressure and density of the form $P = K\rho^{1+1/n}$. By combining the equations of hydrostatic equilibrium and mass conservation, we derive the Lane-Emden equation:

$$\frac{1}{\xi^{2}}\frac{d}{d\xi}\left(\xi^{2}\frac{d\theta}{d\xi}\right)=-\theta^{n}$$

In this project, we numerically solve this second-order differential equation to obtain the dimensionless profiles of temperature and density.

## 2. Methodology
- **Numerical Solver:** The equation is integrated using the **Euler Method**.
- **Step Size:** $h = 0.0001$.
- **Boundary Conditions:** $\theta(0) = 1$ and $\frac{d\theta}{d\xi}(0) = 0$.
- **Validation:** The code was validated against analytical solutions for $n=0$, $n=1$, and $n=5$.

## 3. Key Findings for the Sun (n=3)
Using the solar mass ($M_\odot$) and radius ($R_\odot$) as constraints, the following central parameters were obtained for a polytropic index $n=3$:

| Parameter | Value |
| :--- | :--- |
| **First Root ($\xi_1$)** | 6.8968 |
| **Central Density ($\rho_c$)** | 76.36 g/cm³ |
| **Central Pressure ($P_c$)** | 1.24 $\times$ 10¹⁷ dyn/cm² |
| **Central Temperature ($T_c$)** | 1.57 $\times$ 10⁷ K |
| **Estimated Luminosity ($L$)** | 4.8 $\times$ 10³³ erg/s |


## 4. Repository Structure
The following files contain the implementation and analysis of the solar model:

* **lane.m**: Core function to solve the Lane-Emden equation.
* **lane_emden_euler.m**: Numerical integration script using the Euler method.
* **lanem.m**: Script to calculate the cumulative mass distribution $M_{n}(\xi)$.
* **resultados.m**: Main script to generate all physical profiles and visualizations (Density, Temperature, and Mass).
* **Lane_Emden__Modelo_politrópico_del_Sol.pdf**: Full technical report in Spanish with detailed physical analysis.

## 5. Visualizations
The model produces several key astrophysical profiles:
1. **Dimensionless Profiles:** Comparison of $\theta(\xi)$ for different values of $n$.
2. **Solar Density & Temperature:** Radial distribution from the core to the surface.
3. **Mass Distribution:** Shows that most of the solar mass is concentrated within $r < 0.5 R_\odot$.

---
**Note:** This project was developed as part of the Astrophysics course at the *Universitat de València*.
