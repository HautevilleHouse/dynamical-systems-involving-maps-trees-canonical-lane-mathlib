import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTrees

structure SubshiftFiniteTypePackage where
  adjacencyMatrix : ℕ → ℕ → Prop
  forbiddenWords : List (List ℕ)
  subshift : (ℕ → ℕ) → Prop
  soficShift : Prop
  zetaFunctionExists : Prop

structure SubshiftFiniteTypeEvidence (P : SubshiftFiniteTypePackage) where
  subshiftClosed : P.subshift (λ n => 0)
  soficShiftClosed : P.soficShift
  zetaFunctionExistsClosed : P.zetaFunctionExists

def SubshiftFiniteTypeClosed (P : SubshiftFiniteTypePackage) : Prop :=
  P.soficShift ∧ P.zetaFunctionExists

theorem subshift_finite_type_closed_from_evidence (P : SubshiftFiniteTypePackage)
    (E : SubshiftFiniteTypeEvidence P) : SubshiftFiniteTypeClosed P :=
  And.intro E.soficShiftClosed E.zetaFunctionExistsClosed

end DynamicalSystemsInvolvingMapsTrees
end HautevilleHouse