package com.springapp.mvc;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TacticsRepository extends JpaRepository<TacticsEntity, Long> {
    List<TacticsEntity> findByLevel(String level);
}
