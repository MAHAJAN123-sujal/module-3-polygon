pragma circom 2.0.0;

template MahajanCustomCircuit () {  
    // signal inputs
    signal input A;
    signal input B;

    // signal from gates
    signal X;
    signal Y;

    // final signal output
    signal output Q;

    // component gates used to create custom circuit
    component andGate = AND();
    component notGate = NOT();
    component orGate = OR();

    // logic for AND gate
    andGate.a <== A;
    andGate.b <== B;
    X <== andGate.out;

    // logic for NOT gate
    notGate.in <== B;
    Y <== notGate.out;

    // logic for OR gate
    orGate.a <== X;
    orGate.b <== Y;
    Q <== orGate.out;  
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a * b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2 * in;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a * b;
}

component main = MahajanCustomCircuit();
