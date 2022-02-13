import qsharp

from QuantumRNG import GenerateRandomBit

min = 20
max = 60

output = 0

while (output < 20) or (output > 60):
	bits = []

	for i in range(0, max.bit_length()):
		bits.append(GenerateRandomBit.simulate())
	
	output = int("".join(str(bit) for bit in bits), 2)

print("The random number generated is " + str(output))