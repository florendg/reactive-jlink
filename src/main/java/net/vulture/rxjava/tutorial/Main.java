package net.vulture.rxjava.tutorial;


import io.reactivex.rxjava3.core.Flowable;
import io.reactivex.rxjava3.core.Observable;


public class Main {
   private static final System.Logger LOGGER = System.getLogger(Main.class.getName());
   public static void main(String[] args) {

      Observable<String> obs = Flowable.just("Hello World").toObservable();
      obs.subscribe(next-> LOGGER.log(System.Logger.Level.INFO,next),
              error-> LOGGER.log(System.Logger.Level.ERROR,error),
              ()-> LOGGER.log(System.Logger.Level.INFO,"finished")).dispose();

   }
}
