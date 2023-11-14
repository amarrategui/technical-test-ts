import { Module } from '@nestjs/common';
import { LoggerModule } from '../modules/logger/logger.module';

@Module({
  controllers: [],
  providers: [],
  imports: [LoggerModule],
  exports: [LoggerModule],
})
export class GlobalModules {}
