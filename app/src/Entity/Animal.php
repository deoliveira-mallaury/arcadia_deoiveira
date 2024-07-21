<?php

namespace App\Entity;

use App\Repository\AnimalRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AnimalRepository::class)]
class Animal
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50)]
    private ?string $name = null;

    #[ORM\Column(length: 50)]
    private ?string $condition = null;

    /**
     * @var Collection<int, VeterinaryRepport>
     */
    #[ORM\OneToMany(targetEntity: VeterinaryRepport::class, mappedBy: 'animal')]
    private Collection $veterinaryRepports;

    #[ORM\ManyToOne(inversedBy: 'animals')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Race $race = null;

    #[ORM\ManyToOne(inversedBy: 'animals')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Habitat $habitat = null;

    public function __construct()
    {
        $this->veterinaryRepports = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getCondition(): ?string
    {
        return $this->condition;
    }

    public function setCondition(string $condition): static
    {
        $this->condition = $condition;

        return $this;
    }

    /**
     * @return Collection<int, VeterinaryRepport>
     */
    public function getVeterinaryRepports(): Collection
    {
        return $this->veterinaryRepports;
    }

    public function addVeterinaryRepport(VeterinaryRepport $veterinaryRepport): static
    {
        if (!$this->veterinaryRepports->contains($veterinaryRepport)) {
            $this->veterinaryRepports->add($veterinaryRepport);
            $veterinaryRepport->setAnimal($this);
        }

        return $this;
    }

    public function removeVeterinaryRepport(VeterinaryRepport $veterinaryRepport): static
    {
        if ($this->veterinaryRepports->removeElement($veterinaryRepport)) {
            // set the owning side to null (unless already changed)
            if ($veterinaryRepport->getAnimal() === $this) {
                $veterinaryRepport->setAnimal(null);
            }
        }

        return $this;
    }

    public function getRace(): ?Race
    {
        return $this->race;
    }

    public function setRace(?Race $race): static
    {
        $this->race = $race;

        return $this;
    }

    public function getHabitat(): ?Habitat
    {
        return $this->habitat;
    }

    public function setHabitat(?Habitat $habitat): static
    {
        $this->habitat = $habitat;

        return $this;
    }
}
