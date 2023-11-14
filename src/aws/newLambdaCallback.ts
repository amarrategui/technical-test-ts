import { INestApplicationContext } from '@nestjs/common';
import { ContextIdFactory, NestFactory } from '@nestjs/core';
import { Context } from 'aws-lambda';
import { container } from '../log/logger';
import { ServerModule } from 'src/server/server.modules';
import { WinstonModule } from 'nest-winston';
import { winstonConfig } from 'src/libs/logging.lib';

let app: INestApplicationContext;

async function bootstrap(): Promise<INestApplicationContext> {
  if (!app) {
    app = await NestFactory.createApplicationContext(ServerModule);
  }

  return app;
}

async function bootstrapHandler(event, context: Context) {
  const instance = await bootstrap();

  const logger = container.get('aws.lambda');
  logger.debug('Application Started');

  instance.useLogger(WinstonModule.createLogger(winstonConfig()));

  const contextId = ContextIdFactory.create();
  instance.registerRequestByContextId({ context }, contextId);

  await instance.close();

  logger.debug('Lambda closed successfully');

  return;
}

export const handler = bootstrapHandler;
