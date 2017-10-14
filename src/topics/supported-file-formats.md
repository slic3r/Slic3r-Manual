# Slic3r Supported File Formats
Slic3r supports STL, OBJ, AMF formats. This document shows what each format carries and what is supported by Slic3r.

## STL
* Slic3r fully supports STL binary and Ascii files.
* STL doesn't support color, materials, metadata or other common CAD model attributes. Most of those attributes are not needed for 3D printing.
* One of the biggest disadvantages in STL format that it doesn't contain a list of all the vertices indices as all vertices are defined in their facets. This problem appear became obvious when you are trying to find whether two facets are neighbors or not, all you can is to compare between vertices numerically which of course having rounding errors. 


## OBJ
* Slic3r supports OBJ file formats.
* OBJ is a simple data format carrying the 3D geometry of the model (its vertices, vertex normals, meshes and UV position of each texture coordinate vertex)
* OBJ materials are stored in external .mtl files. However, Materials in OBJ format carry information about the color of the facets, their textures, and attributes of a surface according to [Phong reflection model](https://en.wikipedia.org/wiki/Phong_reflection_model) and those attributes are not used in Slic3r as they say nothing about the interior of the object.

### What is supported by Slic3r when reading/writing OBJ files:
| | Supported in Slic3r |
| ------------- |:-------------:|
| Materials | NO | 
| Textures and .mtl files | NO |

## AMF
* Slic3r supports AMF.
* AMF is by far better than STL, It can represent one object or more objects arranged in a constellation. Also, It can specify the material for each volume in an object. It contains metadata about the objects and other elements.
* Materials in AMF format are properties of the volumes not just like OBJ format. They carry information about the nature of the surface. These are examples of the materials in AMF XML structure. 
```
<material id="1">
    <metadata type="Name">StiffMaterial</metadata>
  </material>
  <material id="2">
    <metadata type="Name">FlexibleMaterial</metadata>
  </material>
  <material id="3">
    <metadata type="Name">MediumMaterial</metadata>
    <composite materialid="1">0.4</composite>
    <composite materialid="2">0.6</composite>
  </material>
  <material id="4">
    <metadata type="Name">VerticallyGraded</metadata>
    <composite materialid="1">z</composite>
    <composite materialid="2">10-z</composite>
  </material>
  <material id="5">
    <metadata type="Name">Checkerboard</metadata >
    <composite materialid="1"> 
          floor(x+y+z%1)+0.5) </composite>
    <composite materialid="2"> 
          1-floor(x+y+z%1)+0.5) </composite>
  </material>
```

### AMF Simple Structure Example
This Example is a taken from the Wikipedia example but it's more simplified  
```xml
<?xml version="1.0" encoding="utf-8"?>
<amf unit="inch" version="1.1">  <!-- All elements should be contained in the <amf> element -->
  <metadata type="name"></metadata> <!-- Metadata element -->
  <object id="1"> <!-- Object element with identifier -->
    <mesh> <!-- Mesh inside an object -->
      <vertices> <!-- Mesh Vertices -->
        <vertex><coordinates><x>0</x><y>0</y><z>0</z></coordinates></vertex> <!-- A Vertex (x, y, z) coordinates -->
      </vertices>
      <volume materialid="1"> <!-- Volume having material with an identifier -->
        <metadata type="name">Hard side</metadata>  <!-- Metadata element -->
        <!-- Triangular Mesh consits of three vertices from the mentioned above in the mesh vertices elements -->
        <triangle><v1>2</v1><v2>1</v2><v3>0</v3></triangle>
      </volume>
    </mesh>
  </object>
  <material id="2">  <!-- Material element -->
    <metadata type="name">Hard material</metadata>
    <color><r>0.1</r><g>0.1</g><b>0.1</b></color>
  </material>
</amf>
```

### What is supported by Slic3r when reading/writing AMF files:
| | Supported in Slic3r |
| ------------- |:-------------:|
| Materials | YES|
| Metadata | YES |
| Curved triangles | NO |
| Constellations | YES |
| Textures | NO | 

when writing AMF files, we save additional data which are:
* Print configuration for each object and each Material.
* Print configuration for each volume and whether it's a modifier volume or not.
* Slic3r version in each metadata element in objects, materials, and volumes 

## References
* [STL (file format) - Wikipedia](https://en.wikipedia.org/wiki/STL_(file_format))
* [Wavefront .obj file - Wikipedia](https://en.wikipedia.org/wiki/Wavefront_.obj_file)
* [Additive Manufacturing File Format - Wikipedia](https://en.wikipedia.org/wiki/Additive_Manufacturing_File_Format)
* [3D printing file format cage match: AMF vs. 3MF - GrabCAD Blog](http://blog.grabcad.com/blog/2015/07/21/amf-vs-3mf/)
* [Standrad Specification for AMF](http://amf.wikispaces.com/file/view/AMF_V0.48.pdf)
