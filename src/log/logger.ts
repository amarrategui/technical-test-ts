import { format, transports } from 'winston';
import * as winston from 'winston';
//for static log level use info,debug,warn,error instead of process.env.LOG_LEVEL
export const container = new winston.Container();
container.add('tasks', {
  format: format.uncolorize(),
  transports: [
    new transports.Console({
      level: process.env.LOG_LEVEL || 'info',
      format: format.combine(format.timestamp(), format.ms(), format.simple()),
    }),
  ],
});

container.add('apigateway', {
  format: format.uncolorize(),
  transports: [
    new transports.Console({
      level: process.env.LOG_LEVEL || 'info',
      format: format.combine(format.timestamp(), format.ms(), format.simple()),
    }),
  ],
});

container.add('aws.cognito', {
  format: format.uncolorize(),
  transports: [
    new transports.Console({
      level: process.env.LOG_LEVEL || 'info',
      format: format.combine(format.timestamp(), format.ms(), format.simple()),
    }),
  ],
});

container.add('assignResourceTask', {
  format: format.uncolorize(),
  transports: [
    new transports.Console({
      level: process.env.LOG_LEVEL || 'info',
      format: format.combine(format.timestamp(), format.ms(), format.simple()),
    }),
  ],
});

container.add('aws.lambda', {
  format: format.uncolorize(),
  transports: [
    new transports.Console({
      level: process.env.LOG_LEVEL || 'info',
      format: format.combine(format.timestamp(), format.ms(), format.simple()),
    }),
  ],
});
