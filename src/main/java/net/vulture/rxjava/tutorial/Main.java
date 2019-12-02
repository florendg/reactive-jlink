package net.vulture.rxjava.tutorial;


import io.reactivex.rxjava3.core.Observable;

public class Main {
   private static final System.Logger LOGGER = System.getLogger(Main.class.getName());

   public static void main(String[] args) {
      var obs = Observable.create(s -> {
         s.onNext(1);
         s.onNext(2);
         s.onNext(3);
         s.onComplete();
      });
      obs.map( num -> "Number " + num)
              .subscribe(s->LOGGER.log(System.Logger.Level.INFO,s))
              .dispose();

   }
}
