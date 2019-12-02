package net.vulture.rxjava.tutorial;

import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public class DemoObserver implements Subscriber<String> {


    @Override
    public void onNext(String s) {
        //TODO add some logic
    }

    @Override
    public void onError(Throwable throwable) {
        //TODO add some logic
    }

    @Override
    public void onComplete() {
        //TODO add some logic
    }


    @Override
    public void onSubscribe(Subscription subscription) {
        //TODO add some logic
    }
}
