import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingMapsTrees.TreeMapsDynamics
import HautevilleHouse.DynamicalSystemsInvolvingMapsTrees.ShiftSpaceTopology

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTrees

structure SymbolicDynamicsClosurePackage where
  treePkg : TreeMapsDynamicsPackage
  shiftPkg : ShiftSpaceTopologyPackage
  symbolicRepresentation : TreeMapsDynamicsPackage.treeType treePkg → (ℕ → ShiftSpaceTopologyPackage.alphabetType shiftPkg)
  conjugacyWithShift : Prop
  entropyPreservation : Prop

structure SymbolicDynamicsClosureEvidence (P : SymbolicDynamicsClosurePackage) where
  conjugacyWithShiftClosed : P.conjugacyWithShift
  entropyPreservationClosed : P.entropyPreservation

def SymbolicDynamicsClosureClosed (P : SymbolicDynamicsClosurePackage) : Prop :=
  P.conjugacyWithShift ∧ P.entropyPreservation

theorem symbolic_dynamics_closure_closed_from_evidence (P : SymbolicDynamicsClosurePackage)
    (E : SymbolicDynamicsClosureEvidence P) : SymbolicDynamicsClosureClosed P :=
  And.intro E.conjugacyWithShiftClosed E.entropyPreservationClosed

end DynamicalSystemsInvolvingMapsTrees
end HautevilleHouse