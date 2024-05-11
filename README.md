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
