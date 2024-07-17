<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240717135313 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
       $this->addSql('ALTER TABLE veterinary_repport ADD animal_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE veterinary_repport ADD CONSTRAINT FK_1587F5F18E962C16 FOREIGN KEY (animal_id) REFERENCES animal (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_1587F5F18E962C16 ON veterinary_repport (animal_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE animal DROP CONSTRAINT FK_6AAB231F6E59D40D');
        $this->addSql('DROP INDEX IDX_6AAB231F6E59D40D');
        $this->addSql('ALTER TABLE animal DROP race_id');
        $this->addSql('ALTER TABLE veterinary_repport DROP CONSTRAINT FK_1587F5F18E962C16');
        $this->addSql('DROP INDEX IDX_1587F5F18E962C16');
        $this->addSql('ALTER TABLE veterinary_repport DROP animal_id');
    }
}
