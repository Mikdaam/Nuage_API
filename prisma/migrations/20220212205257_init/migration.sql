-- CreateTable
CREATE TABLE "Entreprise" (
    "id_entreprise" SERIAL NOT NULL,
    "nom" VARCHAR(255) NOT NULL,
    "pays" VARCHAR(100) NOT NULL,

    CONSTRAINT "Entreprise_pkey" PRIMARY KEY ("id_entreprise")
);

-- CreateTable
CREATE TABLE "Jeu" (
    "id_jeux" SERIAL NOT NULL,
    "titre" VARCHAR(255) NOT NULL,
    "date_sortie" TIMESTAMP(3) NOT NULL,
    "prix" DOUBLE PRECISION NOT NULL,
    "age_requis" INTEGER NOT NULL,
    "description_jeux" TEXT NOT NULL,
    "id_editeur" INTEGER NOT NULL,
    "id_developpeur" INTEGER NOT NULL,

    CONSTRAINT "Jeu_pkey" PRIMARY KEY ("id_jeux")
);

-- CreateTable
CREATE TABLE "Succes" (
    "num_succes" SERIAL NOT NULL,
    "intitule" VARCHAR(255) NOT NULL,
    "conditions" TEXT NOT NULL,
    "id_jeux" INTEGER NOT NULL,

    CONSTRAINT "Succes_pkey" PRIMARY KEY ("num_succes")
);

-- CreateTable
CREATE TABLE "Joueur" (
    "pseudo" VARCHAR(255) NOT NULL,
    "passwd" VARCHAR(255) NOT NULL,
    "nom" VARCHAR(255) NOT NULL,
    "adress_mail" VARCHAR(255) NOT NULL,
    "date_naissance" TIMESTAMP(3) NOT NULL,
    "monnaie" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Joueur_pkey" PRIMARY KEY ("pseudo")
);

-- CreateTable
CREATE TABLE "EstAmi" (
    "pseudo_joueur_1" VARCHAR(255) NOT NULL,
    "pseudo_joueur_2" VARCHAR(255) NOT NULL,

    CONSTRAINT "EstAmi_pkey" PRIMARY KEY ("pseudo_joueur_1","pseudo_joueur_2")
);

-- CreateTable
CREATE TABLE "Debloque" (
    "num_succes" INTEGER NOT NULL,
    "pseudo" VARCHAR(255) NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Debloque_pkey" PRIMARY KEY ("num_succes","pseudo")
);

-- CreateTable
CREATE TABLE "Appartient" (
    "id_jeux" INTEGER NOT NULL,
    "genre" VARCHAR(255) NOT NULL,

    CONSTRAINT "Appartient_pkey" PRIMARY KEY ("id_jeux","genre")
);

-- CreateTable
CREATE TABLE "Achat" (
    "id_jeux" INTEGER NOT NULL,
    "pseudo" VARCHAR(255) NOT NULL,

    CONSTRAINT "Achat_pkey" PRIMARY KEY ("id_jeux","pseudo")
);

-- CreateTable
CREATE TABLE "Partager" (
    "id_jeux" INTEGER NOT NULL,
    "pseudo_joueur_1" VARCHAR(255) NOT NULL,
    "pseudo_joueur_2" VARCHAR(255) NOT NULL,

    CONSTRAINT "Partager_pkey" PRIMARY KEY ("pseudo_joueur_1","pseudo_joueur_2")
);

-- CreateIndex
CREATE UNIQUE INDEX "Partager_pseudo_joueur_1_id_jeux_key" ON "Partager"("pseudo_joueur_1", "id_jeux");

-- AddForeignKey
ALTER TABLE "Jeu" ADD CONSTRAINT "Jeu_id_editeur_fkey" FOREIGN KEY ("id_editeur") REFERENCES "Entreprise"("id_entreprise") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Jeu" ADD CONSTRAINT "Jeu_id_developpeur_fkey" FOREIGN KEY ("id_developpeur") REFERENCES "Entreprise"("id_entreprise") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Succes" ADD CONSTRAINT "Succes_id_jeux_fkey" FOREIGN KEY ("id_jeux") REFERENCES "Jeu"("id_jeux") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EstAmi" ADD CONSTRAINT "EstAmi_pseudo_joueur_1_fkey" FOREIGN KEY ("pseudo_joueur_1") REFERENCES "Joueur"("pseudo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EstAmi" ADD CONSTRAINT "EstAmi_pseudo_joueur_2_fkey" FOREIGN KEY ("pseudo_joueur_2") REFERENCES "Joueur"("pseudo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Debloque" ADD CONSTRAINT "Debloque_num_succes_fkey" FOREIGN KEY ("num_succes") REFERENCES "Succes"("num_succes") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Debloque" ADD CONSTRAINT "Debloque_pseudo_fkey" FOREIGN KEY ("pseudo") REFERENCES "Joueur"("pseudo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appartient" ADD CONSTRAINT "Appartient_id_jeux_fkey" FOREIGN KEY ("id_jeux") REFERENCES "Jeu"("id_jeux") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Achat" ADD CONSTRAINT "Achat_id_jeux_fkey" FOREIGN KEY ("id_jeux") REFERENCES "Jeu"("id_jeux") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Achat" ADD CONSTRAINT "Achat_pseudo_fkey" FOREIGN KEY ("pseudo") REFERENCES "Joueur"("pseudo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Partager" ADD CONSTRAINT "Partager_id_jeux_fkey" FOREIGN KEY ("id_jeux") REFERENCES "Jeu"("id_jeux") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Partager" ADD CONSTRAINT "Partager_pseudo_joueur_1_fkey" FOREIGN KEY ("pseudo_joueur_1") REFERENCES "Joueur"("pseudo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Partager" ADD CONSTRAINT "Partager_pseudo_joueur_2_fkey" FOREIGN KEY ("pseudo_joueur_2") REFERENCES "Joueur"("pseudo") ON DELETE RESTRICT ON UPDATE CASCADE;
