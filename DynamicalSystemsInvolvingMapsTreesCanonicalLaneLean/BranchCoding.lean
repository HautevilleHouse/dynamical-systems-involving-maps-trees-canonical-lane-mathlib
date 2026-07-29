import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure BranchCut (X : Type u) (T : TreeDynamicalSystem X) where
  branchPoint : X
  childSubtrees : List (Set X)
  partitionProperty : Prop
  codingMap : ℕ → X → X
  codingConsistency : Prop

structure MarkovPartition (X : Type u) (T : TreeDynamicalSystem X) where
  rectangles : List (Set X × Set X)
  markovProperty : Prop
  generatingProperty : Prop
  topologicalMarkovChain : Prop

def coding_closure (X : Type u) (T : TreeDynamicalSystem X) (B : BranchCut X T) : Prop :=
  B.partitionProperty ∧ B.codingConsistency

theorem coding_closed_from_evidence (X : Type u) (T : TreeDynamicalSystem X) (B : BranchCut X T) : coding_closure X T B := by
  exact And.intro B.partitionProperty B.codingConsistency

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse