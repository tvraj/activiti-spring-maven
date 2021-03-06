// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springsource.roo.loanrequest.server.domain;

import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springsource.roo.loanrequest.server.domain.LoanRequest;
import org.springsource.roo.loanrequest.server.domain.LoanRequestDataOnDemand;
import org.springsource.roo.loanrequest.server.domain.LoanRequestIntegrationTest;

privileged aspect LoanRequestIntegrationTest_Roo_IntegrationTest {
    
    declare @type: LoanRequestIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: LoanRequestIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: LoanRequestIntegrationTest: @Transactional;
    
    @Autowired
    private LoanRequestDataOnDemand LoanRequestIntegrationTest.dod;
    
    @Test
    public void LoanRequestIntegrationTest.testCountLoanRequests() {
        Assert.assertNotNull("Data on demand for 'LoanRequest' failed to initialize correctly", dod.getRandomLoanRequest());
        long count = LoanRequest.countLoanRequests();
        Assert.assertTrue("Counter for 'LoanRequest' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void LoanRequestIntegrationTest.testFindLoanRequest() {
        LoanRequest obj = dod.getRandomLoanRequest();
        Assert.assertNotNull("Data on demand for 'LoanRequest' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LoanRequest' failed to provide an identifier", id);
        obj = LoanRequest.findLoanRequest(id);
        Assert.assertNotNull("Find method for 'LoanRequest' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'LoanRequest' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void LoanRequestIntegrationTest.testFindAllLoanRequests() {
        Assert.assertNotNull("Data on demand for 'LoanRequest' failed to initialize correctly", dod.getRandomLoanRequest());
        long count = LoanRequest.countLoanRequests();
        Assert.assertTrue("Too expensive to perform a find all test for 'LoanRequest', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<LoanRequest> result = LoanRequest.findAllLoanRequests();
        Assert.assertNotNull("Find all method for 'LoanRequest' illegally returned null", result);
        Assert.assertTrue("Find all method for 'LoanRequest' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void LoanRequestIntegrationTest.testFindLoanRequestEntries() {
        Assert.assertNotNull("Data on demand for 'LoanRequest' failed to initialize correctly", dod.getRandomLoanRequest());
        long count = LoanRequest.countLoanRequests();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<LoanRequest> result = LoanRequest.findLoanRequestEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'LoanRequest' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'LoanRequest' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void LoanRequestIntegrationTest.testFlush() {
        LoanRequest obj = dod.getRandomLoanRequest();
        Assert.assertNotNull("Data on demand for 'LoanRequest' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LoanRequest' failed to provide an identifier", id);
        obj = LoanRequest.findLoanRequest(id);
        Assert.assertNotNull("Find method for 'LoanRequest' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyLoanRequest(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'LoanRequest' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LoanRequestIntegrationTest.testMergeUpdate() {
        LoanRequest obj = dod.getRandomLoanRequest();
        Assert.assertNotNull("Data on demand for 'LoanRequest' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LoanRequest' failed to provide an identifier", id);
        obj = LoanRequest.findLoanRequest(id);
        boolean modified =  dod.modifyLoanRequest(obj);
        Integer currentVersion = obj.getVersion();
        LoanRequest merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'LoanRequest' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LoanRequestIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'LoanRequest' failed to initialize correctly", dod.getRandomLoanRequest());
        LoanRequest obj = dod.getNewTransientLoanRequest(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'LoanRequest' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'LoanRequest' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'LoanRequest' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void LoanRequestIntegrationTest.testRemove() {
        LoanRequest obj = dod.getRandomLoanRequest();
        Assert.assertNotNull("Data on demand for 'LoanRequest' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LoanRequest' failed to provide an identifier", id);
        obj = LoanRequest.findLoanRequest(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'LoanRequest' with identifier '" + id + "'", LoanRequest.findLoanRequest(id));
    }
    
}
