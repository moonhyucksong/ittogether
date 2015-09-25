/*
 * requirejs 라이브러리의 환경 설정
 */

/*
 * baseUrl: 라이브러리를 찾는 기본 디렉토리
 * paths: 기본 디렉토리 외에 다른 디렉토리의 별명 설정 
 */
requirejs.config({
    paths: {
        //라이브러리
        'jquery': 'bower_components/jquery/dist/jquery',
        'angular': 'bower_components/angular/angular',
        'bootstrap.min': 'bower_components/bootstrap/dist/js/bootstrap',
        'bootstrap-tour': 'bower_components/bootstrap-tour/build/js/bootstrap-tour',
        'classie': 'bower_components/classie/classie',
        'imagesloaded': 'bower_components/imagesloaded/imagesloaded',
        'AnimOnScroll': 'js/lib/AnimOnScroll',
        'metisMenu': 'bower_components/metisMenu/metisMenu',
        'angular-route': 'bower_components/angular-route/angular-route',
        'myFriendList': 'js/app/myFriendList',
        //컨트롤러
        'main': 'js/app/main',
        'tour': 'js/app/tour',
        'myActivities': 'js/app/myActivities',
        'myMap' : 'js/app/myMap',
        'main_map' : 'js/app/main_map',
        'myFriendList': 'js/app/myFriendList',
    },
  
  shim: {
    'angular': {
        deps: ['jquery']
    },
    'angular-route': {
      deps: ['angular']
    },
    'tour': {
      deps:['bootstrap-tour']
    },
    'bootstrap.min': {
      deps: ['jquery']
    },
    'bootstrap-tour': {
      deps:['jquery']
    },
    'main': {
      deps: ['angular-route', 'bootstrap.min', 'tour','myFriendList','myActivities', 'main_map']
    },
    'myActivities': {
      deps: ['angular']
    },
    'main_map': {
      deps: ['angular']
    },
    'myFriendList': {
      deps:['angular']
    },
  }
  
});

require(['main'], function() {
    angular.bootstrap(document, ['main']);
});









