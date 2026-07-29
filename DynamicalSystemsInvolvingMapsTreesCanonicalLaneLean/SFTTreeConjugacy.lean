import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTrees

structure TreeShiftSpace where
  tree : Type u
  shiftMap : tree → tree
  topology : TopologicalSpace tree
  shiftContinuous : Prop
  shiftContinuousTerm : shiftContinuous

structure SubshiftOfFiniteTypePackage (S : TreeShiftSpace) where
  forbiddenWords : Set (List S.tree)
  sftCondition : Prop
  adjacencyMatrix : Type v
  adjacencyMatrixFinite : Fintype (Σ n, Fin n → S.tree)
  sftConditionTerm : sftCondition
  adjacencyMatrixFiniteTerm : adjacencyMatrixFinite

structure SFTEvidence {S : TreeShiftSpace}
    (P : SubshiftOfFiniteTypePackage S) where
  sftConditionClosed : P.sftCondition
  adjacencyMatrixFiniteClosed : P.adjacencyMatrixFinite

def SFTClosed {S : TreeShiftSpace} (P : SubshiftOfFiniteTypePackage S) : Prop :=
  P.sftCondition ∧ Fintype (Σ n, Fin n → S.tree)

theorem sft_closed_from_evidence {S : TreeShiftSpace}
    (P : SubshiftOfFiniteTypePackage S) (E : SFTEvidence P) : SFTClosed P := by
  exact And.intro E.sftConditionClosed E.adjacencyMatrixFiniteClosed

end DynamicalSystemsInvolvingMapsTrees
end HautevilleHouse