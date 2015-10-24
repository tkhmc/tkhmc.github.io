gulp = require "gulp"
del = require "del"
notify = require "gulp-notify"
plumber = require "gulp-plumber"
changed = require "gulp-changed"
coffee = require "gulp-coffee"
sass = require "gulp-sass"
haml = require "gulp-haml"
bower = require "main-bower-files"
replace = require "gulp-replace"

tasks = ["coffee", "haml", "scss", "img", "lib"]
gulp.task "default", tasks

gulp.task "clean", (cb) ->
  return del ["./*.html", "./js", "./css", "./img"], cb

gulp.task "watch", ["default"], ->
  gulp.watch "./src/**/*.coffee", ["coffee"]
  gulp.watch "./src/**/*.haml", ["haml"]
  gulp.watch "./src/**/*.scss", ["scss"]
  gulp.watch "./src/img/**/*", ["img"]
  return

# compile
gulp.task "coffee", ->
  return gulp.src "./src/**/*.coffee"
    .pipe(plumber({errorHandler: notify.onError("Error: <%= error.message %>")}))
    .pipe(changed("./"))
    .pipe(coffee())
    .pipe(gulp.dest("./"))

gulp.task "haml", ->
  return gulp.src "./src/**/*.haml"
    .pipe(plumber({errorHandler: notify.onError("Error: <%= error.message %>")}))
    .pipe(changed("./"))
    .pipe(haml())
    .pipe(gulp.dest("./"))

gulp.task "scss", ->
  return gulp.src "./src/**/*.scss"
    .pipe(plumber({errorHandler: notify.onError("Error: <%= error.message %>")}))
    .pipe(changed("./"))
    .pipe(sass())
    .pipe(gulp.dest("./"))

gulp.task "img", ->
  return gulp.src "./src/**/img/*"
    .pipe(plumber({errorHandler: notify.onError("Error: <%= error.message %>")}))
    .pipe(changed("./img"))
    .pipe(gulp.dest("./img"))

gulp.task "lib-copy", ->
  return gulp.src(bower())
    .pipe(plumber({errorHandler: notify.onError("Error: <%= error.message %>")}))
    .pipe(changed("./lib"))
    .pipe(gulp.dest("./lib"))

# font位置修正
gulp.task "lib-fix", ["lib-copy"], ->
  return gulp.src("./lib/bootstrap.min.css")
    .pipe(plumber({errorHandler: notify.onError("Error: <%= error.message %>")}))
    .pipe(changed("./lib/bootstrap.min.css"))
    .pipe(replace(/url\(\.\.\/fonts\//g, "url("))
    .pipe(gulp.dest("./lib"))

gulp.task "lib", ["lib-fix"]
