import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure TopologicalEntropyPackage (T : TreeIterationPackage) where
  entropyValue : ℝ
  entropyComputed : Prop
  entropyNonnegative : Prop
  entropyClosed : Prop

structure TopologicalEntropyEvidence {T : TreeIterationPackage}
    (E : TopologicalEntropyPackage T) where
  entropyComputedClosed : E.entropyComputed
  entropyNonnegativeClosed : E.entropyNonnegative
  entropyClosedClosed : E.entropyClosed

def TopologicalEntropyClosed {T : TreeIterationPackage}
    (E : TopologicalEntropyPackage T) : Prop :=
  E.entropyComputed ∧ E.entropyNonnegative ∧ E.entropyClosed

theorem topological_entropy_closed_from_evidence {T : TreeIterationPackage}
    (E : TopologicalEntropyPackage T) (Ev : TopologicalEntropyEvidence E) :
    TopologicalEntropyClosed E := by
  exact And.intro Ev.entropyComputedClosed (And.intro Ev.entropyNonnegativeClosed Ev.entropyClosedClosed)

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse