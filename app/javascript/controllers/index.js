// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import DatatablesController from "./datatables_controller"
application.register("datatables", DatatablesController)

import SelectController from "./ts/select_controller"
application.register("select", SelectController)

