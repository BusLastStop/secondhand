package com.bus.controller;

import org.openstreetmap.gui.jmapviewer.JMapViewer;
import org.openstreetmap.gui.jmapviewer.Coordinate;

import javax.swing.*;
import java.awt.*;

public class OpenStreetMapExample {
    public static void main(String[] args) {
        // Create the main frame
        JFrame frame = new JFrame("OpenStreetMap Example");
        frame.setSize(800, 600);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Create a JMapViewer instance
        JMapViewer mapViewer = new JMapViewer();

        // Set an initial zoom level and center position
        mapViewer.setZoom(10); // Zoom level (higher = closer)
        mapViewer.setDisplayPosition(new Coordinate(37.5665, 126.9780), 10); // Center map on Seoul, South Korea

        // Add the map viewer to the frame
        frame.setLayout(new BorderLayout());
        frame.add(mapViewer, BorderLayout.CENTER);

        // Show the frame
        frame.setVisible(true);
    }
}

