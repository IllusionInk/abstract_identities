# Abstract Identities

> The Studio Entry ceremony at the National Institute of Design, is conducted for the incoming batch by their respective discipline seniors.  As a fun exercise , I tried exploring **Generative art** , with the idea of making something unique for each junior. 

## Idea

Generative Art technically refers to art that stems as a whole or inpart from an autonomous system. [Wikipedia](https://en.wikipedia.org/wiki/Generative_art) The autonomous system here being an algorithm that could map certain variables onto a canvas, using a user defined key. The goal was to generate an artwork that is unique for each kid, although it belongs to the same parent family.

> Generative Identity Design is a concept that stems from Generative Art, wherein the identity system for a brand affords for variations in its depiction. Rather than having a set predefined identity mark, it is generated algorithmically for all users in system.

**Based on this, we decided to develop 'Generative Identity Cards' for our juniors.**

## Dataset

A glimpse of the datasheet that was filled by the juniors. Apart from the standard variables such as:
- **Age**
- **Gender**
- **Date of birth**
- **Birth place** (later mapped with their lat, long).

We also chose some variables to look at their work and hobbies:
- **Work Experience**
- **Hobbies** (later split into Indoor v/s Outdoor Hobbies)

![Snapshot](https://github.com/IllusionInk/abstract_identities/blob/master/Assets/Dataset-02.jpg)

## Concept Sketches

Thoughts and process for the same has been documented (coming soon!)
![Sketch](https://github.com/IllusionInk/abstract_identities/blob/master/Assets/Sketches-01.jpg)

## Algorithm 

- Using the concept sketches, a basic key was developed mapping the various variables onto unique patterns.
- Load the necessary data table and svg shapes onto variables in your code .
- Begin reading the data table rowwise, getting the row no. in a variable. This will be used further to extract and map all user data into variables.
- Since each student's artwork must be stored in a different PDF, use *beginRecord()* and *endRecord()* functions for doing so. *More details in references* 
- The variables were further marked as defined in the key above. Most of these are mappings are direct (*the code has been commented to reflect the same*).
- The names of the students are also depicted in the code. The numerals below reflect the alphabet positions (derived from the ASCII values).

> One of the interesting mappings in the artwork, hobbies was mapped slightly differently. The indoor-outdoor hobbies have been mapped in the respective areas of the circle. 
The key being, the eliipses for hobbies were measured from the shape's edge (using radius as a parameter to measure).


## Generative Renders

![Final Key](https://github.com/IllusionInk/abstract_identities/blob/master/Assets/Viz_Key.jpg)
![digital_render_1](https://github.com/IllusionInk/abstract_identities/blob/master/Assets/Identity_Cards_1.jpg)
![digital_render_2](https://github.com/IllusionInk/abstract_identities/blob/master/Assets/Identity_Cards_2.jpg)

## Tools

- **Processing**: Used to generate the artwork with the aid of several existing functions in there.
    - **beginRecord(), endRecord()**: Generating individuals PDFs for the students.
    - **map()**: Mapping lat long of birthplace to cartesian co-ordinates.
    - **arc()**: Mapping date and month of birth to the arcs on a clock.
    - **pushMatrix(), popMatrix()**: Shifting the origin to required positions for mapping shapes.

- **Illustrator**: Design the glyphs and export as svgs. Assemble the final generative artworks.

## References

 - [Record function](https://processing.org/reference/beginRecord_.html)
 -  More functions referred from the [Processing Library](https://processing.org/reference/)

