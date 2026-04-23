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
The repository consists of several specialized MatLab scripts designed for the numerical integration and physical analysis of the model:

### Core Solvers & Integration
* **`lane.m`**: The primary function to solve the Lane-Emden equation using iterative recursion.
* **`lane_emden_euler.m`**: Implementation of the numerical integration using the Euler method, handling the singularity at the origin.
* **`lanem.m`**: Extended solver that calculates the dimensionless mass distribution $M(\xi)$ alongside the structural variables.

### Analysis & Validation
* **`comparacion_errores.m`**: Quantifies the accuracy of the numerical model by calculating maximum absolute errors against exact analytical solutions for $n=0$, $n=1$, and $n=5$.
* **`masas.m`**: Visualizes and compares the mass distribution $M_n(\theta)$ for different polytropic indices.

### Graphics & Visualizations
* **`grafs.m`**: The main post-processing script. It converts dimensionless variables into physical units for the Sun ($T$ in K, $\rho$ in $g/cm^3$, and $M$ in $M_\odot$) and generates the final solar profiles.
* **`grafs_theta.m`**: Generates comparative plots for the dimensionless variables $\theta(\xi)$ and $\theta(\xi)^n$ for various indices ($n = 0, 1, 1.5, 3, 5$).
* **`grafs_luminosidad.m`**: (Optional) Analysis of the energy production and luminosity profiles based on the temperature results.


## 5. Visualizations
The model produces several key astrophysical profiles:
1. **Dimensionless Profiles:** Comparison of $\theta(\xi)$ for different values of $n$.
2. **Solar Density & Temperature:** Radial distribution from the core to the surface.
3. **Mass Distribution:** Shows that most of the solar mass is concentrated within $r < 0.5 R_\odot$.

---
**Note:** This project was developed as part of the Astrophysics course at the *Universitat de València*.
