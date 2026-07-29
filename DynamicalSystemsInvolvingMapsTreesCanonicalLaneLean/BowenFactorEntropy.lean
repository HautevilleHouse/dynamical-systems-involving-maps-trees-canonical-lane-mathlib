import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTrees

structure BowenFactorPackage where
  tree : Type u
  shiftMap : tree → tree
  topology : TopologicalSpace tree
  entropy : ℝ
  mixingProperty : Prop
  entropyPositivity : entropy > 0
  mixingPropertyTerm : mixingProperty
  entropyPositivityTerm : entropyPositivity

structure BowenFactorEvidence (B : BowenFactorPackage) where
  mixingPropertyClosed : B.mixingProperty
  entropyPositivityClosed : B.entropyPositivity

def BowenFactorClosed (B : BowenFactorPackage) : Prop :=
  B.mixingProperty ∧ B.entropy > 0

theorem bowen_factor_closed_from_evidence (B : BowenFactorPackage)
    (E : BowenFactorEvidence B) : BowenFactorClosed B := by
  exact And.intro E.mixingPropertyClosed E.entropyPositivityClosed

end DynamicalSystemsInvolvingMapsTrees
end HautevilleHouse