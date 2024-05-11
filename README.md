# FIR Filter Design Using the Window Method

This project demonstrates the design of Finite Impulse Response (FIR) filters using the window method.
## Introduction to FIR Filters and the Window Method

### What are FIR Filters?

Finite Impulse Response (FIR) filters are digital filters that operate by convolving a finite number of input samples with a response that is nonzero only for a limited duration. This response, known as the impulse response, is finite because it settles to zero after a certain number of samples. FIR filters are defined by this impulse response, which is essentially a series of coefficients. When a signal passes through an FIR filter, each output sample is calculated as the weighted sum of current and past input samples.

# Characteristics of FIR Filters
1. **Stability:** Since FIR filters do not use feedback (all the coefficients on past outputs are zero), they are inherently stable. The output does not rely on previous outputs, only on past and current input values.
   
2. **Phase Linearity**: FIR filters can easily be designed to have a linear phase, meaning the phase response of the filter is a linear function of frequency. This results in equal delay across all frequencies, which is crucial in applications like data communications and audio processing where phase distortion can be detrimental.
   
3. **Arbitrary Frequency Response:** FIR filters can be designed to achieve an exact linear phase response and can approximate any frequency shape within practical limitations. This makes them extremely versatile for a variety of applications.

4. **Implementation Simplicity:** The structure of FIR filters is straightforward, which makes them easier to implement, especially on hardware that supports parallel processing. This simplicity also means they are less prone to errors in implementation.

# Why are FIR Filters Important?

1. **Control over Signal Integrity:** They are essential in applications where the integrity of the phase of the signal must be maintained, such as in telecommunications and audio signal processing.
   
2. **Flexibility in Design:** The ability to precisely control the frequency response of FIR filters makes them suitable for a wide range of applications, from removing unwanted noise in a signal to shaping signals in a transmission.
   
3. **Robustness in Applications:** FIR filters are preferred in applications where stability and predictable behavior are critical, such as in real-time systems and safety-critical applications.

### Significance of the Window Method

The window method is a popular technique used in the design of FIR filters due to its simplicity and effectiveness. It involves multiplying a desired ideal filter's impulse response by a window function. This process helps to mitigate unwanted ripples in the frequency response (Gibbs phenomenon) by controlling how the filter's response tapers off at the edges. Different window functions can be chosen based on specific trade-offs between the main lobe width and the level of side lobe attenuation, which affects the filter's frequency selectivity and leakage.

The choice of window affects the filter’s performance characteristics, including its passband and stopband behavior, making it crucial to select the appropriate window based on the application’s requirements. By using the window method, designers can easily tailor FIR filter characteristics to meet specific criteria, thus enabling more precise control over the filtering process.


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
