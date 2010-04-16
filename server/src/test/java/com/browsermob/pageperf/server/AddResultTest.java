package com.browsermob.pageperf.server;

import com.browsermob.pageperf.server.*;
import org.junit.Assert;
import org.junit.Test;

public class AddResultTest {

    @Test
    public void shouldReturn0ForGetX(){
        AddResult add = new AddResult();
        Assert.assertEquals(0,add.getX());
    }

    @Test
    public void shouldReturn0ForGetY(){
        AddResult add = new AddResult();
        Assert.assertEquals(0,add.getY());
    }

    @Test
    public void shouldReturnTheResultOfAnAddition(){
        AddResult add = new AddResult(5,6);
        Assert.assertEquals(11,add.getResult());
    }
}
