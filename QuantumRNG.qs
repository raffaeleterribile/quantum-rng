namespace QuantumRNG {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;

    @EntryPoint()
    operation SampleRandomNumber() : Int {
        let min = 10;
        let max = 50;
        Message($"Sampling a random number between {min} and {max}: ");
        return SampleRandomNumberInRange(min, max);
    }

    operation SampleRandomNumberInRange(min : Int, max: Int) : Int {
        mutable output = 0;

        repeat {
            mutable bits = new Result[0];

            for (bitIndex in (BitSizeI(min) - 1)..BitSizeI(max)) {
                set bits += [GenerateRandomBit()];
            }

            set output = ResultArrayAsInt(bits);
        } until ((output >= min) and (output <= max));

        return output;
    }

    operation GenerateRandomBit() : Result {
        using(qubit = Qubit()) {
            // Si pone il Qubit in Superposition
            H(qubit);

            // Si misura il valore del Qubit
            // Questo metodo è equivalente al successivo
            //mutable result = M(qubit);
            //Reset(qubit);
            //return result;

            // Si misura il valore del Qubit
            return MResetZ(qubit);
        }
    }
}

