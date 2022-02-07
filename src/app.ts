import express,{Application} from 'express';
import config from 'config';

import logger from './utils/logger';

const port: Number = config.get<number>('port');

const app: Application = express();

app.use(express.json());

app.listen(port, (): void => {
    logger.info(`Server is running on port ${port}`);
});
