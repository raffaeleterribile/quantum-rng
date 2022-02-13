using System;
using System.Linq;
using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace QuantumRNG {
	class QuantumRNGDriver {
		static void Main(string[] args) {
			using(var simulator = new QuantumSimulator()) {
				var bits = "0";

				int min = 20;
				int max = 60;

				//int minSize = Convert.ToInt32(Math.Floor(Math.Log(min, 2.0)));
				int maxSize = Convert.ToInt32(Math.Floor(Math.Log(max, 2.0) + 1));
				
				int output = 0;

				while ((output < min) || (output > max)) {
					bits = "0";

					bits = String.Join("", Enumerable.Range(0, maxSize)
								.Select(index => GenerateRandomBit.Run(simulator).Result == Result.One ? "1" : "0"));

					output = Convert.ToInt32(bits, 2);
				}

				Console.WriteLine($"The random number generated is {output}");
			}
		}

		public override bool Equals(object obj)
		{
			return base.Equals(obj);
		}

		public override int GetHashCode()
		{
			return base.GetHashCode();
		}

		public override string ToString()
		{
			return base.ToString();
		}
	}
}