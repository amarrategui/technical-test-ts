import { Module, Logger } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { GlobalModules } from '../global/global.modules';
import { HttpModule } from '@nestjs/axios';
@Module({
  imports: [ConfigModule.forRoot(), GlobalModules, HttpModule],
  providers: [Logger],
})
export class ServerModule {}
