package net.vulture.rxjava.tutorial;

import io.reactivex.Flowable;
import io.reactivex.Observable;

import java.util.concurrent.TimeUnit;

public class Main {
   public static void main(String[] args) {
      Flowable.just("Hello World")
            //.delaySubscription(10, TimeUnit.SECONDS)
            .subscribe(System.out::println).dispose();
      var obs = Observable.just("Hello");
      var sub = obs.subscribe(System.out::println);
      sub.dispose();
   }
}
