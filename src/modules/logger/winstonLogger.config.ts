import { utilities as nestWinstonModuleUtilities } from 'nest-winston';
import * as winston from 'winston';

export function getCurrentLogLevel() {
  return process.env.LOG_LEVEL || 'info';
}

export function winstonConfig() {
  return {
    level: getCurrentLogLevel(),
    transports: [
      new winston.transports.Console({
        format: winston.format.combine(
          winston.format.timestamp(),
          winston.format.ms(),
          nestWinstonModuleUtilities.format.nestLike('-', {
            prettyPrint: true,
          }),
        ),
      }),
    ],
  };
}
