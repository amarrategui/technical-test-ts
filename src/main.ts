import { NestFactory } from '@nestjs/core';
import { ServerModule } from './server/server.modules';
import { container } from './log/logger';

async function bootstrap() {
  const app = await NestFactory.create(ServerModule);
  const logger = container.get('aws.lambda');

  console.log('Hello World');
}

bootstrap();
