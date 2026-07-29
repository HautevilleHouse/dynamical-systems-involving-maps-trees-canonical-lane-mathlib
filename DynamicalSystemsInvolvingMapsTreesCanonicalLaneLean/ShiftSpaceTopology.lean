import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTrees

structure ShiftSpaceTopologyPackage where
  alphabetType : Type u
  shiftMap : (ℕ → alphabetType) → (ℕ → alphabetType)
  shiftInvariantMeasures : Prop
  topologicalEntropyComputed : Prop
  markovPartition : Prop

structure ShiftSpaceTopologyEvidence (P : ShiftSpaceTopologyPackage) where
  shiftInvariantMeasuresClosed : P.shiftInvariantMeasures
  topologicalEntropyComputedClosed : P.topologicalEntropyComputed
  markovPartitionClosed : P.markovPartition

def ShiftSpaceTopologyClosed (P : ShiftSpaceTopologyPackage) : Prop :=
  P.shiftInvariantMeasures ∧ P.topologicalEntropyComputed∧ P.markovPartition

theorem shift_space_topology_closed_from_evidence (P : ShiftSpaceTopologyPackage)
    (E : ShiftSpaceTopologyEvidence P) : ShiftSpaceTopologyClosed P :=
  And.intro E.shiftInvariantMeasuresClosed
    (And.intro E.topologicalEntropyComputedClosed E.markovPartitionClosed)

end DynamicalSystemsInvolvingMapsTrees
end HautevilleHouse