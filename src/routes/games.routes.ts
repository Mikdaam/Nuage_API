import { Router } from 'express';
import { getAllGames, getGame } from '../controllers/games.controller';
import validate from '../middleware/validateGame';

const router = Router();


router.get('/games', validate, getAllGames);

router.get('/games/:id', validate, getGame);