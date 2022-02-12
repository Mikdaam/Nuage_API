import express,{Application, Request, Response} from 'express';
import config from 'config';

import logger from './utils/logger';

const port: Number = config.get<number>('port');

const app: Application = express();

app.use(express.json());

/* To test my API */
app.get('/', (req: Request, res: Response): void => {
    res.send('<h2>The API works.!!</h2>');
});

app.listen(port, (): void => {
    logger.info(`Server is running on port ${port}`);
});
