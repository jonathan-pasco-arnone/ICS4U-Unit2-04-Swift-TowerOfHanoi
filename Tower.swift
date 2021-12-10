//
// This program solves
// the Tower of Hanoi riddle.
//
// @author  Jonathan Pasco-Arnone
// @version 1.0
// @since   2021-12-08
//

// Making an error case.
enum MyError: Error {
    case invalidInteger(String)
}

func hanoi(nOfDisks: Int, startPeg: Int, endPeg: Int) throws {
    // This function calculates where the disks should be placed in
    let pegNumber: Int = 6
    let toPeg: String = "to peg"
    if nOfDisks == 1 {
        print("Move disk 1 from peg", startPeg, toPeg, endPeg)
    } else {
        try hanoi(nOfDisks: (nOfDisks - 1), startPeg: startPeg, endPeg: (pegNumber - startPeg - endPeg))
        print("Move disk", nOfDisks, "from peg", startPeg, toPeg, endPeg)
        try hanoi(nOfDisks: (nOfDisks - 1), startPeg: (pegNumber - startPeg - endPeg), endPeg: endPeg)
    }
}

let startPeg: Int = 1
let endPeg: Int = 3

print("Tower of Hanoi")

// Inputs
print("\nHow many disks do you want?: ")
do {
    let nOfDisksInput = readLine()
    if let nOfDisks = Int(nOfDisksInput!) {

        if nOfDisks > 0 {
            // Process.
            try hanoi(nOfDisks: nOfDisks, startPeg: startPeg, endPeg: endPeg)
        } else {
            print("\nPlease enter a positive Integer")
        }

    } else {
        /* This throws an error out of the called function
        and activates the catch statement.
        */
        throw MyError.invalidInteger("Error")
    }
} catch {
    print("That was an invalid input")
}
print("\nDone.")
