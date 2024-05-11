# FIR Filter Design Using the Window Method

This project demonstrates the design of Finite Impulse Response (FIR) filters using the window method.


## Project Phases

The project is divided into several phases:
1. **Phase 1:** Classification of windows based on frequency impulse response,
  considering the size of the main lobe and the shape of the side lobes.

**For the design of FIR filters, I used the following windows, which have the properties:**
- **Chebyshev Window**: Provides a minimax error among the windows, which is optimal for filter design where minimal maximum error is required.
- **Kaiser Window**: Offers a variable parameter that can be adjusted to balance the main lobe width and side lobe attenuation.
- **Lanczos Window**: Known for reducing Gibbs ringing in the time domain by using a sinc function.
- **Tukey Window (Tuckey)**: A blend of rectangular and cosine window functions, allowing for a trade-off between spectral resolution and leakage.
- **Hamming Window**: Features a peak at the center and zero endpoints, which reduces the first side lobe level compared to a rectangular window but has wider main lobes.
- **Hanning Window (Hann)**: Similar to Hamming but with a slightly different cosine function, leading to higher side lobe attenuation but lower resolution.
- **Triangular Window**: Simple linear taper that reduces side lobe levels but offers less control over the shape of the frequency response.
- **Rectangular Window**: Provides no tapering, resulting in sharp main lobes and significant side lobes, typically used for non-critical applications.


2. **Phase 2:**  The second phase of the project involves designing FIR-type frequency transfer functions using the previously presented windows, followed by comparing the frequency characteristics of the obtained filters. Main observation: Responses with high attenuation in the passband have wide transition bands, while those with narrow transition bands have small attenuations.

3. **Phase 3:**  I designed a filter with certain imposed tolerances: the cutoff frequency, the stopband frequency, and the tolerances in the passband and stopband.

4 & 5. **In phases 4 and 5**, I attempted to design two filters that have the lowest possible order, meet the imposed tolerance conditions, and produce a transition band as narrow as possible, for minimal tolerances.
