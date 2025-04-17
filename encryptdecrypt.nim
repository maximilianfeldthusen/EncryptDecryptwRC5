
import nimcrypto, os, strutils, sequtils

proc encryptFile(inputFile: string, outputFile: string, key: string) =
  # Read the content of the input file as a sequence of bytes
  let inputData = readFile(inputFile, fmRead)
  
  # Convert the key to bytes
  let keyBytes = key.toSeq.map(cast[byte])
  
  # Create RC5 cipher instance
  var cipher = newRC5(keyBytes)

  # Encrypt the data
  let encryptedData = cipher.encrypt(inputData)
  
  # Write the encrypted data to the output file
  writeFile(outputFile, encryptedData, fmWrite)

proc decryptFile(inputFile: string, outputFile: string, key: string) =
  # Read the encrypted content of the input file as a sequence of bytes
  let encryptedData = readFile(inputFile, fmRead)
  
  # Convert the key to bytes
  let keyBytes = key.toSeq.map(cast[byte])
  
  # Create RC5 cipher instance
  var cipher = newRC5(keyBytes)

  # Decrypt the data
  let decryptedData = cipher.decrypt(encryptedData)
  
  # Write the decrypted data to the output file
  writeFile(outputFile, decryptedData, fmWrite)

proc main() =
  # Define the input/output files and the encryption key
  let inputFile = "example.txt"
  let encryptedFile = "encrypted.bin"
  let decryptedFile = "decrypted.txt"
  let key = "mysecretkey"

  # Encrypt the file
  encryptFile(inputFile, encryptedFile, key)
  echo "File encrypted successfully."

  # Decrypt the file
  decryptFile(encryptedFile, decryptedFile, key)
  echo "File decrypted successfully."

# Run the main procedure
main()

