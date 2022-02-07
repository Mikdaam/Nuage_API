import { Request, Response } from 'express';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export const getAllGames = async (req: Request, res: Response) => {
    const games = await prisma.jeu.findMany();
    return res.status(200).json(games);
};

export const getGame = async (req: Request, res: Response) => {
    try {
        const { id : game_id } = req.params;

        const game = await prisma.jeu.findOne({
            where: {
                id_jeux: Number(game_id)
            }
        });
    
        if (!game) {
            return res.status(404).json({msg: 'Game not found'});
        } else {
            return res.status(200).json(game);
        }
    } catch (error) {
        return res.status(500).json({msg: 'Server error'});
    }   
}