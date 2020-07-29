package com.hashicorp.app;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

// This will be AUTO IMPLEMENTED by Spring into a Bean called ThingRepository
// CRUD refers Create, Read, Update, Delete

@RepositoryRestResource
public interface ThingRepository extends CrudRepository<Thing, Long> {
    <S extends Thing> S save(S entity);
}