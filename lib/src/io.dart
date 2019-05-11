/*
 * Copyright 2019 Pedro Massango.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

library injectorio;

import 'bean_registry.dart' show DefinitionRegistry;
import 'models.dart';
import 'module_injector.dart';
export 'component_binder.dart';

final InjectorIO io = InjectorIO._internal();
DefinitionRegistry get registry => io._registry;

class InjectorIO {
  DefinitionRegistry _registry;
  InjectorMode _mode = InjectorMode.DEBUG;

  InjectorIO._internal(){
    _registry = DefinitionRegistry.build(_mode);
    if(_mode == InjectorMode.DEBUG) {
      print("InjectorIO:::\t|-----INJECTOR IO-----|");
    }
  }

  factory InjectorIO.start({InjectorMode mode = InjectorMode.DEBUG}){
    mode = mode;
    return io;
  }

  /// Register a new dependency instance
  InjectorIO register(Definition d) {
    _registry.register(d);
    return this;
  }

  /// Register a new dependency module
  InjectorIO module(Module module){
    module.mDef().forEach((d) => this.register(d));
    return this;
  }
}