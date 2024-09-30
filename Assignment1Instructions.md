The passage explains how **Prolog terms** can be used to represent **strings** and **bitstrings**, by associating terms constructed using **unary functors** and the constant `null` with **binary numbers**. Here's a breakdown of the key ideas:

### 1. **Prolog Terms as Strings**
   - Prolog terms are built using a constant `null` and a series of unary functors \( f_0, f_1, \dots, f_k \).
   - These unary functors represent characters from an alphabet \( \{a_0, a_1, \dots, a_k\} \).
   - The constant `null` represents the **empty string**.
   - A Prolog term like `f_i(null)` represents the string consisting of the single character \( a_i \).
   - For strings longer than one character, the string is represented in **reverse order**. For example:
     - The string \( a_2 a_3 \) would be represented as `f_3(f_2(null))`, meaning `f_3` applies first, followed by `f_2`.

### 2. **Simplification to Binary Alphabet**
   - To simplify things, we restrict the alphabet to just **two symbols**: 0 and 1.
   - These are denoted by \( a_0 = 0 \) and \( a_1 = 1 \).
   - The unary functors corresponding to these symbols are \( f_0 \) for 0 and \( f_1 \) for 1.
   
### 3. **Prolog Terms (pterms) for Binary Strings**
   - A **pterm** is a Prolog term constructed from the constant `null`, and the unary functors `f0` (representing 0) and `f1` (representing 1).
   - The structure of these pterms is defined recursively using three rules:
     - `pterm(null).` → `null` is a valid pterm.
     - `pterm(f0(X)) :- pterm(X).` → If `X` is a valid pterm, applying `f0` to `X` (i.e., prepending a 0) is also a valid pterm.
     - `pterm(f1(X)) :- pterm(X).` → If `X` is a valid pterm, applying `f1` to `X` (i.e., prepending a 1) is also a valid pterm.

### 4. **Binary Encoding of Numbers**
   - Numbers are represented as **bitstrings** (binary numbers) using the Prolog terms:
     - 0 is represented by the bitstring `0` and the Prolog term `f0(null)`.
     - 1 is represented by the bitstring `1` and the Prolog term `f1(null)`.
     - 2 is represented by the bitstring `10` and the Prolog term `f0(f1(null))` (which is the reverse encoding of `01`).
     - 3 is represented by the bitstring `11` and the Prolog term `f1(f1(null))`.
   - For each number, the corresponding Prolog term is obtained by encoding the binary digits in reverse.

### 5. **Exclusion of Some Terms**
   - While all pterms are valid Prolog terms, not all correspond to valid encodings of **binary numbers**.
   - For example, the pterm `null` corresponds to the number 0, but a term like `f1(f1(f0(f0(null))))`, though valid as a pterm, does not correspond to a meaningful binary number because it doesn't match any of the bitstrings generated from the rules above (i.e., it doesn't follow the pattern of valid binary number representations).

### Summary:
- The passage introduces a method to encode **binary numbers** as **Prolog terms** using a recursive process.
- Unary functors \( f_0 \) and \( f_1 \) are used to represent the digits 0 and 1, respectively.
- Numbers are encoded by reversing the binary representation, and not all possible Prolog terms (pterms) correspond to valid binary numbers.
