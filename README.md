
## Documentation

### EncryptDecrypt with RC5 in Nim

This code is written in Nim, a statically typed programming language that offers features similar to Python but with a syntax that is more reminiscent of C. The code implements basic file encryption and decryption using the RC5 encryption algorithm, which is a symmetric-key block cipher. Let's break down the code step by step:

### Imports

```nim
import nimcrypto, os, strutils, sequtils
```

- `nimcrypto`: A library that provides cryptographic functions, including the RC5 cipher.
- `os`: A module that provides OS-related functions, such as file reading/writing.
- `strutils`: Contains utility functions for string manipulation.
- `sequtils`: Provides utility functions for working with sequences.

### Encryption Function

```nim
proc encryptFile(inputFile: string, outputFile: string, key: string) =
```

- This defines a procedure named `encryptFile` which takes three parameters: the path to the input file, the path to the output file, and the encryption key.

#### Inside `encryptFile`:

1. **Read Input File**:
   ```nim
   let inputData = readFile(inputFile, fmRead)
   ```
   - Reads the content of `inputFile` and stores it in `inputData` as a sequence of bytes.

2. **Convert Key to Bytes**:
   ```nim
   let keyBytes = key.toSeq.map(cast[byte])
   ```
   - Converts the string `key` to a sequence of bytes.

3. **Create RC5 Cipher**:
   ```nim
   var cipher = newRC5(keyBytes)
   ```
   - Initializes a new RC5 cipher instance using the byte representation of the key.

4. **Encrypt Data**:
   ```nim
   let encryptedData = cipher.encrypt(inputData)
   ```
   - Encrypts the `inputData` using the RC5 cipher.

5. **Write Encrypted Data to Output File**:
   ```nim
   writeFile(outputFile, encryptedData, fmWrite)
   ```
   - Writes the encrypted data to `outputFile`.

### Decryption Function

```nim
proc decryptFile(inputFile: string, outputFile: string, key: string) =
```

- This procedure is similar to `encryptFile` but is used to decrypt an encrypted file.

#### Inside `decryptFile`:

1. **Read Encrypted File**:
   ```nim
   let encryptedData = readFile(inputFile, fmRead)
   ```
   - Reads the content of the `inputFile` (which contains the encrypted data).

2. **Convert Key to Bytes**:
   - Similar to the encryption function, it converts the key to bytes.

3. **Create RC5 Cipher**:
   - Initializes a new RC5 cipher instance using the byte representation of the key.

4. **Decrypt Data**:
   ```nim
   let decryptedData = cipher.decrypt(encryptedData)
   ```
   - Decrypts the `encryptedData` using the RC5 cipher.

5. **Write Decrypted Data to Output File**:
   ```nim
   writeFile(outputFile, decryptedData, fmWrite)
   ```
   - Writes the decrypted data to `outputFile`.

### Main Procedure

```nim
proc main() =
```

- This is the entry point of the program.

#### Inside `main`:

1. **Define File Paths and Key**:
   ```nim
   let inputFile = "example.txt"
   let encryptedFile = "encrypted.bin"
   let decryptedFile = "decrypted.txt"
   let key = "mysecretkey"
   ```
   - Sets the names of the input, output (encrypted), and output (decrypted) files, as well as the secret key used for encryption and decryption.

2. **Encrypt the File**:
   ```nim
   encryptFile(inputFile, encryptedFile, key)
   echo "File encrypted successfully."
   ```
   - Calls the `encryptFile` function, then prints a success message.

3. **Decrypt the File**:
   ```nim
   decryptFile(encryptedFile, decryptedFile, key)
   echo "File decrypted successfully."
   ```
   - Calls the `decryptFile` function, then prints a success message.

### Run the Main Procedure

```nim
main()
```

- This line calls the `main()` procedure to execute the program.

### Summary

The code provides a simple way to encrypt and decrypt files using the RC5 algorithm. The user specifies an input file, an output file for the encrypted data, and a key for the encryption process. The program reads the input file, encrypts its contents, and then allows for the encrypted file to be decrypted back to its original form using the same key.

