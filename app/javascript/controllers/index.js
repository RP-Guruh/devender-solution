// app/javascript/controllers/index.js

import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

// 1. Import komponen 
import Dialog from '@stimulus-components/dialog'
import Confirmation from '@stimulus-components/confirmation'

// 2. Load semua controller lokal Anda (yang ada di folder controllers/)
eagerLoadControllersFrom("controllers", application)

// 3. Daftarkan komponen
application.register('dialog', Dialog)
application.register('confirmation', Confirmation)