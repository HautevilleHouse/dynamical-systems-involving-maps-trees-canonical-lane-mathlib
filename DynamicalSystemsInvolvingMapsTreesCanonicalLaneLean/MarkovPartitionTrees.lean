import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTrees

structure MarkovPartitionTreePackage (A : TreeSymbolSpace) where
  partition : Set (Set A.alphabet)
  markovProperty : ∀ P ∈ partition, A.shiftMap '' P ∈ partition
  partitionCovers : ⋃₀ partition = Set.univ
  markovPropertyTerm : ∀ P ∈ partition, A.shiftMap '' P ∈ partition
  partitionCoversTerm : partitionCovers

structure MarkovPartitionEvidence {A : TreeSymbolSpace}
    (M : MarkovPartitionTreePackage A) where
  markovPropertyClosed : M.markovProperty
  partitionCoversClosed : M.partitionCovers

def MarkovPartitionClosed {A : TreeSymbolSpace}
    (M : MarkovPartitionTreePackage A) : Prop :=
  M.markovProperty ∧ M.partitionCovers

theorem markov_partition_closed_from_evidence {A : TreeSymbolSpace}
    (M : MarkovPartitionTreePackage A) (E : MarkovPartitionEvidence M) :
    MarkovPartitionClosed M := by
  exact And.intro E.markovPropertyClosed E.partitionCoversClosed

end DynamicalSystemsInvolvingMapsTrees
end HautevilleHouse